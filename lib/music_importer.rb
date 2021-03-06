class MusicImporter

  attr_accessor :path, :files

    def initialize(path)
      @path = path
      @files = []
    end

    def files
      @files = Dir.entries(@path).reject{|entry| entry =~ /^.{1,2}$/}
      @files.each {|filename| filename.chomp(".mp3")}
    end

    def import
      files.each {|file| Song.create_from_filename(file)}
    end

end
