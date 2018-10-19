module ApplicationHelper
    
    def point_comparison(user,target)
      return false if user.lucks.blank? || target.blank?
      user.lucks.count >= target&.point 
    end
end
