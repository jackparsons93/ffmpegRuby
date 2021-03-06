require 'streamio-ffmpeg'
movieArr=[]

class NewMovieStuff < FFMPEG::Movie
attr_accessor :name, :outputName



def outputName
  @path.gsub('wmv','mp4')
end

end

 #puts Dir.glob("*.")
Dir.glob("*.wmv").each do |chemVideo|
#   movieArr.push(NewMovieStuff.new(chemVideo))
  tester=NewMovieStuff.new(chemVideo)

  tester.transcode(tester.outputName)
end





 movie = NewMovieStuff.new("TGC_1185_Lect01_OrganicChemistry.m4v")
puts movie.duration # 7.5 (duration of the movie in seconds)
movie.bitrate # 481 (bitrate in kb/s)
puts movie.size # 455546 (filesize in bytes)

puts movie.valid?
movie.video_stream # "h264, yuv420p, 640x480 [PAR 1:1 DAR 4:3], 371 kb/s, 16.75 fps, 15 tbr, 600 tbn, 1200 tbc" (raw video stream info)
movie.video_codec # "h264"
movie.colorspace # "yuv420p"
movie.width # 640 (width of the movie in pixels)
movie.resolution # "640x480"
movie.height # 480 (height of the movie in pixels)
movie.frame_rate # 16.72 (frames per second)

movie.audio_stream # "aac, 44100 Hz, stereo, s16, 75 kb/s" (raw audio stream info)
movie.audio_codec # "aac"
movie.audio_sample_rate # 44100
movie.audio_channels # 2

#movie.transcode("movie.mp4")
