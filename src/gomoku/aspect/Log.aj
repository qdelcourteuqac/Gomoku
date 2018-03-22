package gomoku.aspect;

import gomoku.core.model.Spot;
import gomoku.core.model.Grid;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

@Aspect
public class Log {
    private static final String LOG_FOLDER = "logs";
    private FileWriter fileWriter;
    static final Path file = Paths.get(LOG_FOLDER, "" + System.currentTimeMillis());


    @AfterReturning(
            value = "call(void Grid.notifyStonePlaced(Spot)) && args(spot)"
    )
    public void placeStone(Spot spot) {
        String line = String.format("name:%s;x:%d;y%d", spot.getOccupant().getName(), spot.x, spot.y);
        log(line);
    }

    static void log(String line) {
        try {
            Files.write(file, (line + "\n").getBytes(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
