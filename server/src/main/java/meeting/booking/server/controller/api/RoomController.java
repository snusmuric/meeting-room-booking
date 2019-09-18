package meeting.booking.server.controller.api;

import meeting.booking.server.domain.Room;
import meeting.booking.server.service.RoomService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/api")
@RestController
public class RoomController {
    private RoomService roomService;

    public RoomController(RoomService roomService) {
        this.roomService = roomService;
    }

    @RequestMapping(value = "/rooms", method = RequestMethod.GET)
    public List<Room> rooms() {
        return roomService.loadAllRooms();
    }
}
