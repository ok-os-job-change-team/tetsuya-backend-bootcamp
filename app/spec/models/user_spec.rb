require_relative './user' #user.rbの相対パス

RSpec.describe User do
  describe '#present?' do
    context 'idがnilでない場合' do
      it 'present?がtrueになる' do
        user = User.new(1, 'user@example.com', 'p@ssw0rd')
        expect(user.present?).to eq true
      end
    end
    
    context 'idがnilの場合' do
      it 'present?がfalseになる' do
        user = User.new(nil, 'user@example.com', 'p@ssw0rd')
        expect(user.present?).to eq false
      end
    end
  end
end