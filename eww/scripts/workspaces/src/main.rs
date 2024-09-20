use hyprland::{event_listener::EventListener, shared::{HyprData, HyprDataActive}};

const GRADIENT: [&str; 5] = [
    "${grad1-1}",
    "${grad1-2}",
    "${grad1-3}",
    "${grad1-4}",
    "${grad1-5}"
];

fn clamp(n: usize) -> usize {
    std::cmp::min(n, 4)
}

fn print_button(workspace_id: usize, color: usize, color_right: usize, is_active: bool) {
    let color_hex = GRADIENT[color];
    let color_right_hex = GRADIENT[color_right];
    let class = if is_active {"workspace-active"} else {"workspace-inactive"};
    if workspace_id != 1 {
        print!("(button :onclick \"hyprctl dispatch workspace {workspace_id}\" :width 16 :style \"background-color: {color_hex}\" :class \"{class}\" \"{workspace_id}\") (transition :left-color \"{color_hex}\" :right-color \"{color_right_hex}\") ");
    } else {
        print!("(button :onclick \"hyprctl dispatch workspace {workspace_id}\" :width 16 :style \"background-color: {color_hex}; padding-left: 8px\" :class \"{class}\" \"{workspace_id}\") (transition :left-color \"{color_hex}\" :right-color \"{color_right_hex}\") ");
    }
}

fn handler(_: impl std::any::Any) {
    let workspaces = hyprland::data::Workspaces::get().unwrap();
    let active_workspace = hyprland::data::Workspace::get_active().unwrap();
    if let Ok(id) = active_workspace.id.try_into() {
        print!("(box  :class \"workspaces\" :space-evenly false ");
        for i in 1..10_usize {
            let is_active = workspaces.iter().any(|w| w.id == i as i32);
            let diff = i.abs_diff(id);
            if i < id {
                print_button(i, clamp(diff), clamp(std::cmp::max(diff, 1) - 1), is_active)
            } else {
                print_button(i, clamp(diff), clamp(diff + 1), is_active)
            }
        }
        let is_active = workspaces.iter().any(|w| w.id == 10);
        print_button(10, clamp(10_usize.abs_diff(id)), 4, is_active);
        println!(")");
    }
}

fn main() {
    handler(0);
    let mut listener = EventListener::new();
    listener.add_workspace_change_handler(handler);
    listener.add_workspace_destroy_handler(handler);
    listener.start_listener().unwrap();
}
