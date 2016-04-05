class Stopwatch
  def initialize()
    @start = Time.now
  end
   
  def elapsed_time
    now = Time.now
    elapsed = (now - @start) * 1000.0
    # puts 'Elapsed time: ' +  elapsed.to_s + ' milliseconds'
    elapsed.to_s
  end
end