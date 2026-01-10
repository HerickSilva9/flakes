use eframe::egui;

fn main() -> eframe::Result<()> {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default(),
        ..Default::default()
    };

    eframe::run_native(
        "Hello, world title",
        options,
        Box::new(|_cc| Ok(Box::new(MyApp::default()))),
    )
}

struct MyApp;

impl Default for MyApp {
    fn default() -> Self {
        Self
    }
}

impl eframe::App for MyApp {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        egui::CentralPanel::default().show(ctx, |ui| {
            ui.heading("Hello, world heading");
            ui.label("Hello, world label");
        });
    }
}
