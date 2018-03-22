package gomoku.aspect;

import gomoku.core.Player;
import gomoku.ui.App;
import gomoku.core.model.PlayerList;
import javafx.scene.paint.Color;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import java.util.List;

@Aspect
public class MultiPlayer {
    private int turn;
    private PlayerList playerList;

    public MultiPlayer() {
        this.turn = 0;
        this.playerList = new PlayerList();
        this.playerList.addPLayer(new Player("Ramzi", Color.BLACK));
        this.playerList.addPLayer(new Player("Quentin", Color.WHITE));
    }

    @Around("execution(Player App.getCurrentPlayer())")
    public Object getCurrentPlayer() {
        List<Player> players = this.playerList.getPlayers();
        int playersNumber = players.size();
        Player currentPlayer = players.get(this.turn % playersNumber);

        this.turn++;

        return currentPlayer;
    }
}
