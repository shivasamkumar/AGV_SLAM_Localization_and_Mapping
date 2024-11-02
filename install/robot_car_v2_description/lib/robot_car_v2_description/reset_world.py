#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from std_srvs.srv import Empty

def main(args=None):
    rclpy.init(args=args)
    node = rclpy.create_node('reset_world_node')
    client = node.create_client(Empty, '/reset_world')

    if not client.wait_for_service(timeout_sec=3.0):
        node.get_logger().error('Service /reset_world not available')
        return

    request = Empty.Request()
    client.call_async(request)
    rclpy.shutdown()

if __name__ == '__main__':
    main()
