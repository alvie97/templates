#!/bin/bash
# TODO: if no style file chosen don't add import for it
echo "Enter component name: "
read name
echo "creating $name.js"
touch $name.js

echo "Create style file? (y/n): "
read style

if [[ $style == "y" || $style == "Y" ]]; then
    echo "Enter file extension: "
    read ext
    touch $name.$ext
fi

echo "connect to store? (y/n): "
read store_connect

if [[ $store_connect == "y" || $store_connect == "Y" ]]; then

cat > $name.js <<- EOF
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
EOF

else

    echo "make it a class? (y/n): "
    read class_component 

    if [[ $class_component == "y" || $class_component == "Y" ]]; then
cat > $name.js <<- EOF
import React, { Component } from 'react';
import './${name}.scss';
class ${name^} extends Component {
    render() {
        return (
            <div className="${name}"></div>
        );
    }
}

export default ${name^};
EOF

    else
cat > $name.js <<- EOF
import React from 'react';
import './${name}.scss';

const ${name^} = (props) => {
    return (
        <div className="${name}"></div>
    );
}

export default ${name^};
EOF
    fi
fi


echo "Component $name created"
