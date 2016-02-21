module Olayemi
	class NotesApplication
		attr_reader :name, :notes
		
		

		def initialize author
			errorHandler author
			@name = author
			@notes = []
		end

		public

		def create note_content
			checkNoteInput note_content
			@notes << note_content
		end

		def get note_id
			checkNoteId note_id
			@notes[note_id]
		end

		def list
			return [] if @notes.empty?
			@notes.each do |x|
				return "Note ID: #{@notes.index(x)}\n #{x}\n\nBy Author #{@name}\n"
			end
		end

		def edit note_id, new_content

			checkNoteId note_id
			checkNoteInput new_content
			checkifNoteExists note_id

		    @notes[note_id] = new_content
		end

		def delete note_id
			checkNoteId note_id

			@notes.delete_at note_id
		end

		def search search_text
			checkNoteInput search_text
			result = {}
			@notes.each_with_index do |text, index|
				if !(text =~ /(#{search_text})/).nil?
					result[index] = text
				end
			end

			if !result.empty?
				result.each {|index, text| return "Note ID: #{index}\n #{text}\n\nBy Author #{@name}\n"}
			else
				return "No notes found for the seacrh: #{search_text}"
			end

		end




		private
		def checkifNoteExists note_id
			raise 'Note does not exist' if @notes[note_id].nil?
			return
		end

		def checkNoteInput note
			raise "Input should be a string" if !note.is_a? String
			return
		end

		
		def checkNoteId note_id
			raise 'Note Id must be an Integer' if !note_id.is_a? Integer
			return
		end


		def errorHandler author
			raise "Input should be a string" if !author.is_a? String
			raise "No Chars Allowed" if author.match(/[~!@#$%^&*(){}|:<>]+/)
			raise "Author name cannot be empty" if author.empty?
			raise RuntimeError if author.nil?
			return
		end

	end
end