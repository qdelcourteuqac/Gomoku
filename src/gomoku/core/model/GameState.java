package gomoku.core.model;

public class GameState {
    private GameState.State state = State.STARTED;

    public State getState() {
        return this.state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public enum State {
        STARTED, FINISHED
    }

}
