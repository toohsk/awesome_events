require 'rails_helper'

describe Event do
  describe '#name' do
    it {should validate_presence_of(:name)}
    it {should ensure_length_of(:name).is_at_most(50)}
  end

  describe '#created_by?' do
    #let(:event) {FactoryGirl.create(:event)}
    let(:event) {create(:event)}
    subject {event.created_by?(user)}

    context '引数が nil なとき' do
      let(:user) {nil}
      it {should be_falsey}
    end

    context '#owner_id と 引数の#id が同じとき' do
      let(:user) {double('user', id: event.id)}
      it {should be_truthy}
    end
  end
end

# Eventに対してテストを書くと種類が増える
# describe Event do
#   describe '#name' do
#     context '空白のとき' do
#       let(:event) {Event.new(name: '')}
#
#       it 'valid でないこと' do
#         event.valid?
#         expect(event.errors[:name]).to be_present
#       end
#     end
#
#     context 'nilのとき' do
#       let(:event) {Event.new(name: nil)}
#
#       it 'valid でないこと' do
#         event.valid?
#         expect(event.errors[:name]).to be_present
#       end
#     end
#
#     context '"Rails勉強会"のとき' do
#       let(:event) {Event.new(name: 'Rails勉強会')}
#
#       it 'valid であること' do
#         event.valid?
#         expect(event.errors[:name]).to be_blank
#       end
#     end
#
#     context '50文字のとき' do
#       let(:event) {Event.new(name: 'a'*50)}
#
#       it 'valid であること' do
#         event.valid?
#         expect(event.errors[:name]).to be_blank
#       end
#     end
#
#     context '51文字のとき' do
#       let(:event) {Event.new(name: 'a'*51)}
#
#       it 'valid ではないこと' do
#         event.valid?
#         expect(event.errors[:name]).to be_present
#       end
#     end
#   end
#
# end
