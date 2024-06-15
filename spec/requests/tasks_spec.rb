require 'rails_helper'
# spec/requests/tasks_spec.rb
RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }

  before do
    sign_in user
  end
#index 
  describe "GET /index" do
    context "when user is not logged in" do
      it "redirects to the login page" do
        sign_out user
        get tasks_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    it "returns http success" do
      get tasks_path
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
      get tasks_path
      expect(response).to render_template(:index)
    end
    it "assigns an empty task for new task creation" do
      get tasks_path
      expect(assigns(:task)).to be_a_new(Task)
    end
  end
#show
  describe "GET /show" do
    it "returns http success" do
      get task_path(task)
      expect(response).to have_http_status(:success)
    end
  end
#post

describe "POST /create" do
  context "with valid parameters" do
    let(:task_params) { attributes_for(:task) }
    it "creates a new task" do
      # debugger
      expect {
        post tasks_path, params: {task: task_params}
      }.to change{Task.count}.by(1)
      expect(response).to redirect_to(tasks_path)

    end
  end
  context "with invalid parameters" do
    let(:task_params) { attributes_for(:task, title: nil) }
    # debugger
    it "does not create a new task" do
      expect {
        post tasks_path, params: task_params
      }.to change{Task.count}.by(0)
      expect(response.status).to eq(400)
    end
  end
end

#patch
describe "PATCH /update" do
  context "with valid parameters" do
    let(:updated_attributes) { { title: "Updated Title" } }
    it "updates the requested task" do
      patch task_path(task), params: { task: updated_attributes }
      task.reload
      expect(task.title).to eq('Updated Title')
      expect(response).to redirect_to(tasks_path)
    end
  end
    context "with invalid parameters" do
      let(:invalid_attributes) {{ title: nil }}
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch task_path(task), params: { task: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
#delete
  describe "DELETE /destroy" do
    it "destroys the requested task" do
    task
    # debugger
      expect {
        delete task_path(task)
      }.to change{Task.count}.by(-1)  #on deleting it is removing -1., if it was two task it will be -2
      expect(response).to redirect_to(tasks_path)
    end
  end
#patch
  describe "PATCH /update_status" do

    it "updates the status of the task" do
      # debugger
      patch update_status_task_path(task), params: { status: 'in_progress' }
      task.reload
      # debugger
      expect(task.status).to eq('in_progress')
      expect(response).to redirect_to(tasks_path(status: 'in_progress'))
      
      patch update_status_task_path(task), params: { status: 'done' }
      # debugger
      task.reload
      # debugger
      expect(task.status).to eq('done')
      expect(response).to redirect_to(tasks_path(status: 'done'))
    end
  end
end