require './ass'
include Olayemi

RSpec.describe "NotesApplication" do
	context "instantiation of the notes application" do
		
		it "raises error for no author name" do
			expect {NotesApplication.new}.to raise_error ArgumentError
		end

		it 'raises error for input of digits' do
			expect {NotesApplication.new 4}.to raise_error "Input should be a string"
		end

		it 'raises error for char inputs' do
			expect {NotesApplication.new '@'}.to raise_error 'No Chars Allowed'
		end

		it 'raises error for empty input' do
			expect {NotesApplication.new ''}.to raise_error "Author name cannot be empty"
		end

		it 'raises error for more than one inputs' do
			expect {NotesApplication.new 'a','be'}.to raise_error ArgumentError
		end

		
	end

	context 'checking for different instances' do 
			olayemi = NotesApplication.new 'Olayemi'
			folake = NotesApplication.new 'Folake'

			it 'should return Olayemi' do
				expect(olayemi.name).to eq 'Olayemi'
			end

			it 'should reutrn Folake' do
				expect(folake.name).to eq 'Folake'
			end


	end

	context 'checking if notes is an instance property' do
			author = NotesApplication.new 'Olayemi'

			it 'returns the notes list' do
				expect(author.list).to eq []
			end

	end

	context "Checking if method" do
		author = NotesApplication.new 'Olayemi'

		author.create "Olayemi is fine girl"
		author.create 'This the second note'
		author.create 'Jingle all the way'

		it 'returns the authors name' do 
			expect(author.name).to eq 'Olayemi'
		end
		
		it 'returns the second note in notes' do
			expect(author.get 1).to eq 'This the second note'
		end

		it 'returns nil' do
			expect(author.get 3).to eq nil
		end

		it 'raises error if the get is passed a string' do
			expect {author.get '1'}.to raise_error 'Note Id must be an Integer'
		end

		it 'raises error if edit parameters are not equal' do
			expect {author.edit 1}.to raise_error ArgumentError
		end


		it 'should delete method to raise error if note_id is a string' do
			expect {author.delete "0"}.to raise_error "Note Id must be an Integer"
		end

		it 'should delete index 0' do
			expect {author.delete 0}.to change {author.notes.length}.from(3).to(2)
		end


		it 'should return This is the second note for index 0' do
			expect(author.get 0).to eq "This the second note"
		end

		it 'should delete index 0' do
			expect(author.delete 0).to eq "This the second note"
		end

		it 'should return search not found' do 
			expect(author.search 'book').to eq "No notes found for the seacrh: book"
		end
		

	end

	context "Checking note inputs" do

		author = NotesApplication.new 'Olayemi'

		it 'raises error if input is an Integer' do
			expect {author.create 4}.to raise_error 'Input should be a string'
		end

		it 'raises error if input is an array' do
			expect {author.create []}.to raise_error 'Input should be a string'
		end

		it 'should raise an error if the input is not a string for search' do
			expect {author.search 4}.to raise_error 'Input should be a string'
		end


	end

	context 'checking the list method' do

		author = NotesApplication.new 'Olayemi'

		author.create 'Olayemi is a fine girl'
		author.create 'Olayemi is a fine girl part 2'

		it 'should check the output of list' do
			expect(author.list).to eq "Note ID: 0\n Olayemi is a fine girl\n\nBy Author Olayemi\n"
		end

	end










end