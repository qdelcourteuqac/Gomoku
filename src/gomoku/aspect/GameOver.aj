package gomoku.aspect;

import gomoku.core.Player;
import gomoku.core.model.Grid;
import gomoku.core.model.GameState;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class GameOver {
    private GameState gameState;

    public GameOver() {
        this.gameState = new GameState();
    }

    @Around(value = "execution(boolean Grid.isWonBy(int, int, int, int, Player)) && args(x, y, dx, dy, player)", argNames = "proceedingJoinPoint,x,y,dx,dy,player")
    public boolean isWonBy(ProceedingJoinPoint proceedingJoinPoint, int x, int y, int dx, int dy, Player player) throws Throwable {
        boolean isWon = (boolean) proceedingJoinPoint.proceed();
        if (isWon) {
            Log.log(String.format("The user %s wins !", player.getName()));
            this.gameState.setState(GameState.State.FINISHED);
        }
        return isWon;
    }

    @Around("execution(* Grid.placeStone(..))")
    public Object lockGameIfFinished(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        if (this.gameState.getState() == GameState.State.STARTED) {
            return proceedingJoinPoint.proceed();
        }

        return null;
    }

}
