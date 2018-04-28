#!/bin/bash

echo "Enter component name: "
read name
echo "creating $name.js"
touch $name.js

echo "connect to store? (y/n): "
read store_connect

if [[ $store_connect == "y" || $store_connect == "Y" ]]; then

cat > $name.js <<- EOF
import React, { Component } from 'react';
import { connect } from 'react-redux';
import Main from './components/main';

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
EOF

else
    echo "writting boilerplate"
cat > $name.js <<- EOF
import React from 'react';
const ${name^} = (props) => {
    return (<div></div>);
}

export default ${name^};
EOF

fi

echo "Create style file? (y/n): "
read style

if [[ $style == "y" || $style == "Y" ]]; then
    echo "Enter file extension: "
    read ext
    touch $name.$ext
fi

echo "Component $name created"
