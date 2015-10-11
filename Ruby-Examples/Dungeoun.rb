=begin
	class Dungeon

		attr_accessor :player
		def initialize (name_player)

			@player = Player.new(name_player)
			@rooms = Array.new
		end

		class Player

			attr_accessor :name, :location
			def initialize (name_player)

				@name = name_player
			end
		end

		class Rooms

			def initialize (reference, name, description, connections)

				@reference = reference
				@name = name
				@description = description
				connections = connections
			end
		end
	end

	my_dungeon =  Dungeon.new('Andrés García')
	puts my_dungeon.player.name

	my_player = Dungeon::Player.new('Alejandro Hurtado')
	puts my_player.name 
=end

class DungeonTwo

	attr_accessor :player
	def initialize (name_player)

		@player = Player.new(name_player)
		@rooms = Array.new
	end

	def add_room(reference, name, description, connections)

		@rooms << Room.new(reference, name, description, connections)
	end

	def start(location)

		@player.location = location
		show_current_description
	end

	def show_current_description

		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)

		@rooms.detect{ |room| room.reference == reference}
	end

	def find_room_in_direction(direction)

		find_room_in_dungeon(@player.location).connections[direction]
	end

	def go(direction)

		puts "You go to " + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end

	class Player

		attr_accessor :name, :location
		def initialize(name_player)

			@name = name_player
		end
	end

	class Room

		attr_accessor :reference, :name, :description, :connections
		def initialize (reference, name, description, connections)

			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end

		def full_description

			@name + "\n\nYou're in " + @description
		end
	end
end

my_dungeon =  DungeonTwo.new('Andrés García')
my_dungeon.add_room(:largecave, 'Large Cave', 'A Large Cavernous Cave', {:west => :smallcave})
my_dungeon.add_room(:smallcave, 'Small Cave', 'A Small Claustrophobic Cave', {:east => :largecave})
my_dungeon.start(:largecave)
my_dungeon.show_current_description
my_dungeon.go(:west)
my_dungeon.go(:east)

