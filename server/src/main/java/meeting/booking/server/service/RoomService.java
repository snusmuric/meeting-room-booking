package meeting.booking.server.service;

import meeting.booking.server.domain.Room;
import meeting.booking.server.repository.RoomRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class RoomService {

    private RoomRepository roomRepository;

    public RoomService(RoomRepository roomRepository) {
        this.roomRepository = roomRepository;
    }

    @Transactional(readOnly = true)
    public List<Room> loadAllRooms() {
        return roomRepository.findAllByOrderByNameAsc();
    }
}
