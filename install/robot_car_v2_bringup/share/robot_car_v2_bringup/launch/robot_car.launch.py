import os
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription, TimerAction
from launch_ros.actions import Node
from ament_index_python.packages import get_package_share_directory


def generate_launch_description():
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
            "use_simple_controller": "False"
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
    #     period=10.0,  # wait for 5 seconds, you can adjust this time
    #     actions=[
    #         IncludeLaunchDescription(
    #                 os.path.join(
    #                     get_package_share_directory("robot_car_v2_localization"),
    #                     "launch",
    #                     "local_localization.launch.py"  # Ensure this file includes your EKF launch
    #                 )
    #             )
    #     ]
    # )


    
    return LaunchDescription([
        gazebo,
        controller,
        joystick,
        #ekf_launch,
    ])