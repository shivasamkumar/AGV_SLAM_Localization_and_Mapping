#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav2_simple_commander.robot_navigator import BasicNavigator
from geometry_msgs.msg import PoseStamped, Point
from visualization_msgs.msg import Marker, MarkerArray
import tf_transformations

class WaypointNavigator(Node):
    def __init__(self):
        super().__init__('waypoint_navigator')
        self.nav = BasicNavigator()
        
        # Publisher for waypoint markers as MarkerArray
        self.marker_array_pub = self.create_publisher(
            MarkerArray, 'waypoint_markers', 10)
        
        # Publisher for the dynamic global path marker
        self.path_marker_pub = self.create_publisher(
            Marker, 'global_path_marker', 10)
        
        # Publisher for the goal marker
        self.goal_marker_pub = self.create_publisher(
            Marker, 'goal_marker', 10)
        
        # Waypoints for navigation
        self.waypoints = [
            self.create_pose_stamped(-0.321145, -3.99984, 0.0),
            self.create_pose_stamped(5.02879, -2.27075, 0.0),
            # self.create_pose_stamped(8.45734, 0.801917, 0.0),
            self.create_pose_stamped(2.43776, 0.00746727, 0.0),
            self.create_pose_stamped(-1.25795, -0.354685, 0.0),
            self.create_pose_stamped(-3.28886, -2.44776, -3.14),
            self.create_pose_stamped(-7.15984, -3.4795, -3.14),
            self.create_pose_stamped(-7.54164, 0.129393, 0),
            self.create_pose_stamped(-4.44944, 1.55765, 1.57),
            self.create_pose_stamped(0.997852, 0.00306559, 0),
        ]
        
        # Publish initial waypoint markers
        self.publish_waypoint_markers()

    def create_pose_stamped(self, position_x, position_y, orientation_z):
        q_x, q_y, q_z, q_w = tf_transformations.quaternion_from_euler(0.0, 0.0, orientation_z)
        pose = PoseStamped()
        pose.header.frame_id = 'map'
        pose.header.stamp = self.get_clock().now().to_msg()
        pose.pose.position.x = position_x
        pose.pose.position.y = position_y
        pose.pose.position.z = 0.0
        pose.pose.orientation.x = q_x
        pose.pose.orientation.y = q_y
        pose.pose.orientation.z = q_z
        pose.pose.orientation.w = q_w
        return pose

    def publish_waypoint_markers(self):
        marker_array = MarkerArray()
        for i, waypoint in enumerate(self.waypoints):
            marker = Marker()
            marker.header.frame_id = 'map'
            marker.header.stamp = self.get_clock().now().to_msg()
            marker.ns = "waypoints"
            marker.id = i
            marker.type = Marker.TEXT_VIEW_FACING
            marker.action = Marker.ADD
            marker.pose.position.x = waypoint.pose.position.x
            marker.pose.position.y = waypoint.pose.position.y
            marker.pose.position.z = 0.5  # Offset to make text visible above the waypoint
            marker.pose.orientation.w = 1.0
            marker.text = f"wp{i}"  # Label each waypoint
            marker.scale.z = 0.3  # Text size
            marker.color.a = 1.0  # Fully opaque
            marker.color.r = 1.0
            marker.color.g = 1.0
            marker.color.b = 1.0
            marker_array.markers.append(marker)
        
        # Publish the MarkerArray
        self.marker_array_pub.publish(marker_array)

    def publish_path_marker(self):
        marker = Marker()
        marker.header.frame_id = 'map'
        marker.header.stamp = self.get_clock().now().to_msg()
        marker.ns = "global_path"
        marker.id = 0
        marker.type = Marker.LINE_STRIP
        marker.action = Marker.ADD
        marker.scale.x = 0.05  # Line width
        marker.color.a = 1.0
        marker.color.r = 0.0
        marker.color.g = 1.0
        marker.color.b = 0.0

        # Add each waypoint position to the path
        for waypoint in self.waypoints:
            p = Point()
            p.x = waypoint.pose.position.x
            p.y = waypoint.pose.position.y
            p.z = 0.0
            marker.points.append(p)

        self.path_marker_pub.publish(marker)

    def publish_goal_marker(self, goal_pose):
        marker = Marker()
        marker.header.frame_id = 'map'
        marker.header.stamp = self.get_clock().now().to_msg()
        marker.ns = "goal_marker"
        marker.id = 0
        marker.type = Marker.TEXT_VIEW_FACING
        marker.action = Marker.ADD
        marker.pose.position.x = goal_pose.pose.position.x
        marker.pose.position.y = goal_pose.pose.position.y
        marker.pose.position.z = 0.5  # Offset to make text visible above the goal
        marker.pose.orientation.w = 1.0
        marker.text = "GOAL"  # Label for the goal
        marker.scale.z = 0.4  # Text size
        marker.color.a = 1.0  # Fully opaque
        marker.color.r = 1.0
        marker.color.g = 0.0
        marker.color.b = 0.0
        self.goal_marker_pub.publish(marker)

    def run(self):
        # --- Set initial pose
        initial_pose = self.create_pose_stamped(0.0, 0.0, 0.0)
        self.nav.setInitialPose(initial_pose)

        # --- Wait for Nav2
        self.nav.waitUntilNav2Active()

        # Publish the initial path marker
        self.publish_path_marker()

        # Publish the goal marker for the last waypoint
        self.publish_goal_marker(self.waypoints[-1])

        # --- Follow waypoints
        self.nav.followWaypoints(self.waypoints)
        while not self.nav.isTaskComplete():
            feedback = self.nav.getFeedback()
            # Process feedback if needed, e.g., print(feedback)
            
            # Update path marker dynamically
            self.publish_path_marker()

        # Print the final result
        print(self.nav.getResult())

def main(args=None):
    rclpy.init(args=args)
    navigator = WaypointNavigator()
    navigator.run()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
