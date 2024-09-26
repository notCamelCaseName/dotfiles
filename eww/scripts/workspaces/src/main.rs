use hyprland::{
    event_listener::EventListener,
    shared::{HyprData, HyprDataActive},
};

fn print_button(workspace_id: usize, is_active: bool) {
    let class = if is_active {
        "workspace-active"
    } else {
        "workspace-inactive"
    };
    print!("(button :onclick \"hyprctl dispatch workspace {workspace_id}\" :width 28 :height 28 :class \"{class}\" \"{workspace_id}\")");
}

fn handler(_: impl std::any::Any) {
    let workspaces = hyprland::data::Workspaces::get().unwrap();
    let active_workspace = hyprland::data::Workspace::get_active().unwrap();
    print!("(box  :class \"workspaces\" :space-evenly false");
    for workspace in workspaces.iter().filter(|w| 0 < w.id && w.id < 100) {
        print_button(workspace.id as usize, workspace.id == active_workspace.id);
    }
    println!(")");
}

fn main() {
    handler(0);
    let mut listener = EventListener::new();
    listener.add_workspace_change_handler(handler);
    listener.add_workspace_destroy_handler(handler);
    listener.start_listener().unwrap();
}
