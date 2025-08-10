
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
    v.x /= getMag(v);
    v.y /= getMag(v);
    
    return v;
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

function multVec(v, c) {
    return {
        x: v.x * c,
        y: v.y * c,
    }
}