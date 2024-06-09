# spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:status) }

  describe 'scopes' do
    let(:user) { create(:user) }
    let!(:to_do_task) { create(:task, status: :to_do, user: user) }
    let!(:in_progress_task) { create(:task, status: :in_progress, user: user) }
    let!(:done_task) { create(:task, status: :done, user: user) }

    it 'returns tasks with status to_do' do
      expect(Task.to_do).to include(to_do_task)
      expect(Task.to_do).not_to include(in_progress_task, done_task)
    end

    it 'returns tasks with status in_progress' do
      expect(Task.in_progress).to include(in_progress_task)
      expect(Task.in_progress).not_to include(to_do_task, done_task)
    end

    it 'returns tasks with status done' do
      expect(Task.done).to include(done_task)
      expect(Task.done).not_to include(to_do_task, in_progress_task)
    end

    it 'filters tasks by status' do
      expect(Task.filter_by_status('to_do')).to include(to_do_task)
      expect(Task.filter_by_status('to_do')).not_to include(in_progress_task, done_task)
    end
  end


  describe 'validations' do
      it 'validates presence of user' do
        user = create(:user)
        task = create(:task, user: user)
        expect(task).to be_valid
        # debugger
      end
  end
  
  describe 'validations' do
      it 'validates presence of user while defining association in tasks factory' do
        task = create(:task)
        expect(task).to be_valid
        # debugger
      end
    end
end
