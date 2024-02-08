require_relative '../../app/models/user' #user.rbの相対パス

RSpec.describe User do
  describe '#present?' do
    context 'idがnilでない場合' do
      it 'present?がtrueになる' do
        user = User.new(id: 1, email: 'user@example.com', password: 'p@ssw0rd')
        expect(user.present?).to eq true
      end
    end
    
    context 'idがnilの場合' do
      it 'present?がfalseになる' do
        user = User.new(id: nil, email: 'user@example.com', password: 'p@ssw0rd')
        expect(user.present?).to eq false
      end
    end
  end
end