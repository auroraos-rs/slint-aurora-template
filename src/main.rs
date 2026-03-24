slint::include_modules!();

fn main() -> Result<(), slint::PlatformError> {
    unsafe {
        std::env::set_var("SLINT_SCALE_FACTOR", "2.0");
    }

    let ui = AppWindow::new()?;
    ui.run()
}
