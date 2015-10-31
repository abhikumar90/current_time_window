require 'test/unit'
require 'time'
require 'date'

class TestTimeWindow < Test::Unit::TestCase

DAY = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
HRS = %w[6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22]

 test "test_window_check_days" do
    sat = "Saturday"
    sun = "Sunday"
    mon = "Monday"
    assert DAY[DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).wday], "#{sat} should check Saturday"
    assert DAY[DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).wday], "#{sun} should check Sunday"
    assert DAY[DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).wday], "#{mon} should check Monday"
  end

 test "test_window_check_blank" do
   tue = ["Tuesday"]
   sun = "Sunday"
   assert_nil tue[1]
   assert_equal 'Tuesday',tue[0]
   assert_not_equal('Sunday', tue[0])
   assert_not_same(tue,sun)
 end

test "test_window_check_hours" do
  assert DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).hour, "#{HRS[4]} should check 10hrs"
  assert DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).hour, "#{HRS[5]} should check 11hrs"
  assert DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).hour, "#{HRS[6]} should check 12hrs"
  assert DateTime.parse(Time.now.strftime("%Y-%m-%d %H:%M:%S")).hour, "#{HRS[7]} should check 13hrs"
end

end
