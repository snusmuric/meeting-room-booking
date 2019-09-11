package meeting.booking.server.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@MappedSuperclass
public class BaseEntityImpl implements BaseEntity, Serializable {

    private Long id;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "serial")
    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId());
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }

        if (obj == this) {
            return true;
        }

        if (!getClass().equals(obj.getClass())) {
            return false;
        }

        BaseEntityImpl entity = (BaseEntityImpl) obj;
        if (entity.id == null || id == null) {
            return false;
        }

        return entity.id.equals(id);
    }
}
