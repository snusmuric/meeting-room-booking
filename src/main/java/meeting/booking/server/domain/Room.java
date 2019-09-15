package meeting.booking.server.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Room extends BaseEntityImpl {

    private static final long serialVersionUID = 1L;

    @Column(length = 50, nullable = false)
    @Size(min = 1, max = 50)
    @NotNull
    private String name;

    private String location;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
