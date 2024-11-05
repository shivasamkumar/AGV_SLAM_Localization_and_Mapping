import os
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, DeclareLaunchArgument, TimerAction
from launch.conditions import IfCondition, UnlessCondition
from launch.substitutions import LaunchConfiguration
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():
    use_slam = LaunchConfiguration("use_slam")

    use_slam_arg = DeclareLaunchArgument(
        "use_slam",
        default_value="false"
    )

    gazebo = IncludeLaunchDescription(
        os.path.join(
            get_package_share_directory("robot_car_v2_description"),
            "launch",
            "gazebo.launch.py"
        ),
    )
    
    controller = IncludeLaunchDescription(
        os.path.join(
            get_package_share_directory("robot_car_v2_controller"),
            "launch",
            "robot_car_controller.launch.py"
        ),
        launch_arguments={
            "use_simple_controller": "False",
            "use_python": "False"
        }.items(),
    )
    
    joystick = IncludeLaunchDescription(
        os.path.join(
            get_package_share_directory("robot_car_v2_controller"),
            "launch",
            "joystick_teleop.launch.py"
        ),
        launch_arguments={
            "use_sim_time": "True"
        }.items()
    )

    # ekf_launch = TimerAction(
    #     period=15.0,  # wait for 5 seconds, you can adjust this time
    #     actions=[
    #         IncludeLaunchDescription(
    #                 os.path.join(
    #                     get_package_share_directory("robot_car_v2_localization_planning"),
    #                     "launch",
    #                     "local_localization.launch.py"  # Ensure this file includes your EKF launch
    #                 )
    #             )
    #     ]
    # )


    # safety_stop = Node(
    #     package="robot_car_v2_utils",
    #     executable="safety_stop.py",
    #     output="screen",
    #     parameters=[{"use_sim_time": True}]
    # )

    localization = IncludeLaunchDescription(
        os.path.join(
            get_package_share_directory("robot_car_v2_localization_planning"),
            "launch",
            "global_localization.launch.py"
        ),
        condition=UnlessCondition(use_slam)
    )

    slam = IncludeLaunchDescription(
        os.path.join(
            get_package_share_directory("robot_car_v2_mapping"),
            "launch",
            "slam.launch.py"
        ),
        condition=IfCondition(use_slam)
    )

    rviz_localization = Node(
        package="rviz2",
        executable="rviz2",
        arguments=["-d", os.path.join(
                get_package_share_directory("robot_car_v2_localization_planning"),
                "rviz",
                "rviz_config_planning.rviz"
            )
        ],
        output="screen",
        parameters=[{"use_sim_time": True}],
        condition=UnlessCondition(use_slam)
    )

    rviz_slam = Node(
        package="rviz2",
        executable="rviz2",
        arguments=["-d", os.path.join(
                get_package_share_directory("robot_car_v2_mapping"),
                "config",
                "slam.rviz"
            )
        ],
        output="screen",
        parameters=[{"use_sim_time": True}],
        condition=IfCondition(use_slam)
    )
    
    return LaunchDescription([
        use_slam_arg,
        gazebo,
        controller,
        joystick,
        #ekf_launch,
        # safety_stop,
        localization,
        slam,
        rviz_localization,
        rviz_slam
    ])