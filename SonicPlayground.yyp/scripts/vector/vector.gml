
function createVec(x, y) {
    return {
        x: x,
        y: y,
    }
}

function getMag(v) {
    return sqrt(sqr(v.x) + sqr(v.y));
}

///@desc Normalizes a given vector
///@param {id} v The vector in question
function normalize(v) {
    var m = getMag(v);
    
    return {
        x: v.x / m,
        y: v.y / m,
    }
}

///@desc Returns the sum of two vectors
///@param {id} v1 The first addend
///@param {id} v2 The second addend
function addVec(v1, v2) {
    return {
        x: v1.x + v2.x,
        y: v1.y + v2.y,
    };
}

///@description Returns the difference between two vectors
///@param {id} v1 The minuend
///@param {id} v2 The subtrahend
function subVec(v1, v2) {
    return {
        x: v1.x - v2.x,
        y: v1.y - v2.y,
    };
}

///@description Returns the position vector of an object
///@param {id} obj The object in question
function getPosVec(obj) {
    return {
        x: obj.x,
        y: obj.y,
    }
}

///@description Multiplies a vector by a constant
///@param {struct} vector The vector in question
///@param {real} constant The constant in question
function multVec(vector, constant) {
    return {
        x: vector.x * constant,
        y: vector.y * constant,
    }
}

///@description Divides a vector by a constant
///@param {struct} v The vector in question
///@param {real} c The constant in question
function divVec(v, c) {
    return {
        x: v.x / c,
        y: v.y / c,
    }
}

///@desc Gets the heading of a given vector
///@param {struct} v vector in question
function getHeading(v) {
    var angle = darctan(v.y / v.x);
    
    if (v.x < 0) {
        angle += 180;
    } else if (v.y < 0) {
        angle += 360;
    }
    
    return angle;
}

///@desc Creates a vector from polar coordinates
///@param {real} r The magnitude of the vector
///@param {real} theta The angle of the vector
function createVecPolar(r, theta) {
    return {
        x: dcos(theta) * r,
        y: dsin(theta) * r,
    }
}

function getPerpVector(v) {
    return {
        x: -v.y,
        y: v.x,
    }
}

// UNTESTED
function rotateVector(v, theta) {
    return {
        x: v.x * dcos(theta) - v.y * dsin(theta),
        y: v.x * dsin(theta) + v.y * dcos(theta),
    }
}