package liquibase.ext;

import liquibase.exception.DatabaseException;
import liquibase.exception.LockException;
import liquibase.lockservice.StandardLockService;

/**
 * Forces the Liquibase to release loc in the databaselock table.
 * Sometimes it could be left locked and app will wait indefinitely.
 */
public class ForceReleaseLockService extends StandardLockService {
    @Override
    public int getPriority() {
        return super.getPriority()+1;
    }

    @Override
    public void waitForLock() throws LockException {
        try {
            super.forceReleaseLock();
        } catch (DatabaseException e) {
            throw new LockException("Could not enforce getting the lock.", e);
        }
        super.waitForLock();
    }
}
