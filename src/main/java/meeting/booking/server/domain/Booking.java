package meeting.booking.server.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.OffsetTime;
import java.util.Set;

@Entity
public class Booking extends BaseEntityImpl {

    private static final long serialVersionUID = 1L;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @NotNull
    private OffsetTime bookingStartTime;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @NotNull
    private OffsetTime bookingEndTime;

    private String description;

    private Set<User> participants;

    public OffsetTime getBookingStartTime() {
        return bookingStartTime;
    }

    public void setBookingStartTime(OffsetTime bookingStartTime) {
        this.bookingStartTime = bookingStartTime;
    }

    public OffsetTime getBookingEndTime() {
        return bookingEndTime;
    }

    public void setBookingEndTime(OffsetTime bookingEndTime) {
        this.bookingEndTime = bookingEndTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinTable(
            name = "participant",
            joinColumns = {@JoinColumn(name = "booking_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    public Set<User> getParticipants() {
        return participants;
    }

    public void setParticipants(Set<User> participants) {
        this.participants = participants;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + getId() + '\'' +
                ", bookingStartTime=" + bookingStartTime + '\'' +
                ", bookingEndTime=" + bookingEndTime + '\'' +
                ", description='" + description + '\'' +
                ", participants=" + participants +
                '}';
    }
}
