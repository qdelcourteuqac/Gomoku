package gomoku.aspect;

import gomoku.core.Player;
import gomoku.core.model.Grid;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class GameOver {

    @Around(
            value = "execution(boolean Grid.isWonBy(Player)) && args(player)"
    )
    public boolean isWonBy(ProceedingJoinPoint proceedingJoinPoint, Player player) throws Throwable {
        boolean isWon = (boolean) proceedingJoinPoint.proceed();
        if (isWon) {
            Log.log(String.format("The user %s wins !", player.getName()));
        }
        return isWon;
    }

    @Around("execution(* Grid.placeStone(..))")
    public Object lockGameIfFinished(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Grid grid = (Grid) proceedingJoinPoint.getThis();
        if (!grid.isGameOver()) {
            return proceedingJoinPoint.proceed();
        }

        return null;
    }


}
