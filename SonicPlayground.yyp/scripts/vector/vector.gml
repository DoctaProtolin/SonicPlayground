
function createVec(x, y) {
    return {
        x: x,
        y: y,
    }
}

function getMag(v) {
    return sqrt(sqr(v.x) + sqr(v.y));
}

function normalize(v) {
    var m = getMag(v);
    
    return {
        x: v.x / m,
        y: v.y / m,
    }
}

function addVec(v1, v2) {
    return {
        x: v1.x + v2.x,
        y: v1.y + v2.y,
    };
}

function subVec(v1, v2) {
    return {
        x: v1.x - v2.x,
        y: v1.y - v2.y,
    };
}

function getPosVec(obj) {
    return {
        x: obj.x,
        y: obj.y,
    }
}

///@description Multiplies a vector by a constant.
///@param {struct} vector The vector to multiply.
///@param {real} constant The constant to multiply by.
function multVec(vector, constant) {
    return {
        x: vector.x * constant,
        y: vector.y * constant,
    }
}

function divVec(v, c) {
    return {
        x: v.x / c,
        y: v.y / c,
    }
}

function getHeading(v) {
    var angle = darctan(v.y / v.x);
    
    if (v.x < 0) {
        angle += 180;
    } else if (v.y < 0) {
        angle -= 360;
    }
    
    show_debug_message(v.y);
    
    return angle;
}

function createVecPolar(angle, mag) {
    return {
        x: dcos(angle) * mag,
        y: dsin(angle) * mag,
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