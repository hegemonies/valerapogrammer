
class SimulateAction
  def self.do
    Random.rand(5).times do
      sleep(1)
      print "."
    end
    puts
  end
end
