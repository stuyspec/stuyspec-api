class Profiler
  def initialize(app)
    @app = app
  end

  def profiling_filename(env)
    "profile.txt"
  end

  def call(env)
    # Begin profiling
    RubyProf.measure_mode = RubyProf::WALL_TIME
    RubyProf.start

    # Run all app code
    res = @app.call(env)

    # Stop profiling & save
    out = RubyProf.stop
    File.open(profiling_filename(env), "w+") do |file|
      RubyProf::FlameGraphPrinter.new(out).print(file)
    end

    res
  end
end
