// Modules
import React, { useState, useEffect, useRef } from "react";
import ReactDOM from "react-dom";
import { parse, d3ize } from 'gedcom-d3';

// Components
import Load from './Load';
import Controls from './Controls';
import Graph from './Graph';

// Style
import './sass/style.scss';

// GEDOM files
import familyFile from './gedcoms/family.ged';

const App = () => {

  const [showingRoots, setShowingRoots] = useState(false);
  const [d3Data, setD3Data] = useState([]);
  const [showError, setShowError] = useState(false);
  const [timelineShowing, setTimelineShowing] = useState(false);
  const [highlightedFamily, setHighlightedFamily] = useState();
  const [hoveredNode, setHoveredNode] = useState(null);

  const readFile = file => {
    setD3Data(d3ize(parse(file)));  // Parse data
    setShowingRoots(true);
    setShowError(false);
  }

  const closeRoots = () => {
    setShowingRoots(false);
    setHighlightedFamily();
    setD3Data([]);
  }

  const handleUpload = event => {
    const file = event.target.files[0];
    const parts = file.name.split('.');
    const reader = new FileReader(file);

    if (parts[parts.length -1].toLowerCase() === 'ged') {
      reader.onloadend = () => {
        readFile(reader.result);
      }
      reader.readAsText(file);
    } else {
      reader.readAsText(file);
      setShowError(true);
    }
  }

  return(
    <>
      {!showingRoots ?
        <Load
          handleUpload={handleUpload}
          loadFamily={() => readFile(familyFile)}
          showError={showError}
        /> :
        <>
          <Controls
            d3Data={d3Data}
            closeRoots={closeRoots}
            setTimelineShowing={setTimelineShowing}
            highlightedFamily={highlightedFamily}
            setHighlightedFamily={setHighlightedFamily}
            hoveredNode={hoveredNode}
          />
          <Graph
            d3Data={d3Data}
            highlightedFamily={highlightedFamily}
            setHighlightedFamily={setHighlightedFamily}
            setHoveredNode={setHoveredNode}
          />
        </>
      }
    </>
  )
}

ReactDOM.render(<App />, document.getElementById('root'));
