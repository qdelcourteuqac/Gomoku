package gomoku.aspect;

import gomoku.core.Player;
import gomoku.core.model.Grid;
import org.aspectj.lang.annotation.After;
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
    private final Path file = Paths.get(LOG_FOLDER, "" + System.currentTimeMillis());


    @After(value = "call(void Grid.placeStone(int, int, Player)) && args(x, y, player)", argNames = "x,y,player")
    public void placeStone(int x, int y, Player player) {
        String line = String.format("name:%s;x:%d;y%d\n", player.getName(), x, y);
        try {
            Files.write(this.file, line.getBytes(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
