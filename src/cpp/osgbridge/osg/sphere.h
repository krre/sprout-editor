#pragma once
#include <osg/Shape>
#include "shape.h"

class Sphere : public Shape
{
    Q_OBJECT
    Q_PROPERTY(float radius READ getRadius WRITE setRadius NOTIFY radiusChanged)

public:
    Sphere() {}
    void classBegin() override { osgObj = new osg::Sphere; }
    osg::Sphere* toOsg() { return static_cast<osg::Sphere*>(osgObj.get()); }

    float getRadius() { return toOsg()->getRadius(); }
    void setRadius(float radius);

signals:
    void radiusChanged(float radius);
};
