.class public Ltest/Test;
.super Ljava/lang/Object;
.source "Test.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ifSense()Z
    .registers 2

    .prologue
    .line 5
    .line 7
    const/4 v0, 0x1

    .line 9
    return v0
.end method
