import { ApolloProvider } from '@apollo/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import client from './apolloClient.tsx';
import Home from './pages/Root.tsx';
import StudentDetail from './pages/Student.tsx';

function App() {
  return (
    <ApolloProvider client={client}>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/student/:id" element={<StudentDetail />} />
        </Routes>
      </Router>
    </ApolloProvider>
  );
};

export default App;