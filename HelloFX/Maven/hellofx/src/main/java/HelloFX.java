import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

public class HelloFX extends Application {

    @Override
    public void start(Stage stage) {
        var javaVersion = System.getProperty("java.version");
        var javafxVersion = System.getProperty("javafx.version");

        var browser = new WebView();
        var webEngine = browser.getEngine();
        webEngine.load("https://www.index.hr");

        var vBox = new VBox(browser);
        var scene = new Scene(vBox, 640, 480);

        stage.setTitle("Hello, JavaFX " + javafxVersion + ", running on Java " + javaVersion + ".");
        stage.setScene(scene);
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}