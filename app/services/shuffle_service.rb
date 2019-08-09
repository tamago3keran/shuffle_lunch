class ShuffleService < BaseService
  TRIAL_NUM = 100

  def initialize(users, group_num)
    @users = users
    @group_num = group_num
  end

  def call
    TRIAL_NUM.times.each do
      groups = generate_groups
      devide_user_into_groups(shuffled_users)
      set_best_matching(groups)
    end
    GroupSet.new(groups: best_groups)
  end

  private
    def generate_groups
      @group_num.times.map { |i| eval("@group_#{i} = Group.new") }
    end

    def shuffled_users
      @users.to_a.shuffle
    end

    def devide_user_into_groups(users)
      users.count.times.each do |i|
        group = group_(group_index(i))
        if group.member_ids.empty?
          group.member_ids << users.pop.id
        else
          best_partner = group.best_partner(users)
          group.member_ids << best_partner.id
          users.delete(best_partner)
        end
      end
      #users.count.times.each do |i|
      #  group = group_(group_index(i))
      #  if group.member_ids.empty?
      #    group.member_ids << users[i].id
      #  else
      #    group.member_ids << group.best_partner(users.drop(i)).id
      #  end
      #end
    end

    def group_(num)
      eval("@group_#{num}")
    end

    def group_index(loop_num)
      loop_num % @group_num
    end

    def total_matching_score(groups)
      GroupSet.new(groups: groups).total_matching_score
    end

    def set_best_matching(groups)
      if @best_matching.nil? || best_score > total_matching_score(groups)
        @best_matching = {
          groups: groups,
          total_score: total_matching_score(groups)
        }
      end
    end

    def best_groups
      @best_matching[:groups]
    end

    def best_score
      @best_matching[:total_score]
    end
end
