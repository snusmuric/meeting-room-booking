package meeting.booking.server.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.OffsetTime;
import java.util.Set;

@EqualsAndHashCode(of = {"id"})
@ToString(exclude = {"participants"})
@Data
@Entity
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(columnDefinition = "serial")
    private Long id;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @NotNull
    private OffsetTime bookingStartTime;

    @Column(nullable = false, columnDefinition = "TIMESTAMP WITH TIME ZONE")
    @NotNull
    private OffsetTime bookingEndTime;

    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinTable(
            name = "participant",
            joinColumns = {@JoinColumn(name = "booking_id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id")})
    private Set<User> participants;
}
