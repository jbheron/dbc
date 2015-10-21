class Janitor
  def clean_rooms(hospital)
    hospital.rooms.each { |room| room.clean }
  end
end

janitor(hospital)

## Versus

class Janitor
  def clean_rooms(rooms)
    rooms.each { |room| room.clean }
  end
end

janitor(hospital.rooms)