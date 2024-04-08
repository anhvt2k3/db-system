import './App.css';
import { COLORS, SIZES, STYLES, SHADOW } from './constants';
import { Authenticate } from './components/Authentication';
function App() {
  return (
    <div className='App'
      style={{
        userSelect: 'none',
      }}>
      <Authenticate />
    </div >
  );
}

export default App;
