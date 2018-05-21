import React, { Component } from 'react';
import { connect } from 'react-redux';
import Main from './components/main';
import './${name}.scss';

class ${name^} extends Component {
    render() {

        return (
            <Main />
        );
    }
}


const mapPropsToState = (state) => {
    return {
    };
}

const mapDispatchToProps = (dispatch) => {
    return {
    };
}

export default connect(mapPropsToState, mapDispatchToProps)(${name^});