package gomoku.aspect;

import gomoku.core.model.Grid;
import gomoku.core.model.Spot;
import org.aspectj.lang.annotation.Aspect;

import java.util.List;

@Aspect
privileged public aspect PublishWinningStone {

    public List<Spot> Grid.getWinningStone() {
        return this.winningStones;
    }

}
