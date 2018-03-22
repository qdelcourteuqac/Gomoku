package gomoku.core.model;

import gomoku.core.Player;

import java.util.ArrayList;
import java.util.List;

public class PlayerList {
    private List<Player> players;

    public PlayerList() {
        this.players = new ArrayList<>();
    }

    public void addPLayer(Player player) {
        this.players.add(player);
    }

    public List<Player> getPlayers() {
        return this.players;
    }

}
