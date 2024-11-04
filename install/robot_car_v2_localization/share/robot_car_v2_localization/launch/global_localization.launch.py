import os
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from launch_ros.actions import Node
from launch.actions import DeclareLaunchArgument, IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import LaunchConfiguration, PathJoinSubstitution

def generate_launch_description():

    map_name = LaunchConfiguration("map_name")
    use_sim_time = LaunchConfiguration("use_sim_time")
    amcl_config = LaunchConfiguration("amcl_config")
    lifecycle_nodes = ["map_server", "amcl"]

    # Arguments
    map_name_arg = DeclareLaunchArgument(
        "map_name",
        default_value="small_house"
    )

    use_sim_time_arg = DeclareLaunchArgument(
        "use_sim_time",
        default_value="true"
    )

    amcl_config_arg = DeclareLaunchArgument(
        "amcl_config",
        default_value=os.path.join(
            get_package_share_directory("robot_car_v2_localization"),
            "config",
            "amcl.yaml"
        ),
        description="Full path to amcl yaml file to load"
    )

    # Path to map file
    map_path = PathJoinSubstitution([
        get_package_share_directory("robot_car_v2_mapping"),
        "maps",
        map_name,
        "map.yaml"
    ])
    
    # Nodes for Localization
    nav2_map_server = Node(
        package="nav2_map_server",
        executable="map_server",
        name="map_server",
        output="screen",
        parameters=[
            {"yaml_filename": map_path},
            {"use_sim_time": use_sim_time}
        ],
    )

    nav2_amcl = Node(
        package="nav2_amcl",
        executable="amcl",
        name="amcl",
        output="screen",
        emulate_tty=True,
        parameters=[
            amcl_config,
            {"use_sim_time": use_sim_time},
        ],
    )

    nav2_lifecycle_manager = Node(
        package="nav2_lifecycle_manager",
        executable="lifecycle_manager",
        name="lifecycle_manager_localization",
        output="screen",
        parameters=[
            {"node_names": lifecycle_nodes},
            {"use_sim_time": use_sim_time},
            {"autostart": True}
        ],
    )

    # Include nav2_bringup Launch File
    nav2_bringup_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource([
            os.path.join(
                get_package_share_directory("nav2_bringup"),
                "launch",
                "bringup_launch.py"
            )
        ]),
        launch_arguments={
            "use_sim_time": use_sim_time,
            "params_file": os.path.join(
                get_package_share_directory("robot_car_v2_localization"),
                "config",
                "amcl.yaml"
            ),
            "map": map_path,
        }.items()
    )

    return LaunchDescription([
        map_name_arg,
        use_sim_time_arg,
        amcl_config_arg,
        nav2_map_server,
        nav2_amcl,
        nav2_lifecycle_manager,
        nav2_bringup_launch,  # Include the navigation bringup launch
    ])
