.class public Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;
.super Ljava/lang/Object;
.source "PmsHookBinderInvocationHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field private SIGN:Ljava/lang/String;

.field private base:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 7

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    :try_start_3
    iput-object p1, p0, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;->base:Ljava/lang/Object;

    .line 17
    iput-object p2, p0, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;->SIGN:Ljava/lang/String;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_7} :catch_8

    .line 21
    :goto_7
    return-void

    .line 18
    :catch_8
    move-exception v0

    .line 19
    const-string v1, "jw"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 25
    const-string v0, "getPackageInfo"

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 26
    const/4 v0, 0x1

    aget-object v0, p3, v0

    check-cast v0, Ljava/lang/Integer;

    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x40

    if-ne v0, v1, :cond_2e

    .line 28
    new-instance v1, Landroid/content/pm/Signature;

    iget-object v0, p0, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;->SIGN:Ljava/lang/String;

    invoke-direct {v1, v0}, Landroid/content/pm/Signature;-><init>(Ljava/lang/String;)V

    .line 29
    iget-object v0, p0, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;->base:Ljava/lang/Object;

    invoke-virtual {p2, v0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .line 30
    iget-object v2, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    .line 41
    :goto_2d
    return-object v0

    :cond_2e
    iget-object v0, p0, Lcn/wjdiankong/hookpms/PmsHookBinderInvocationHandler;->base:Ljava/lang/Object;

    invoke-virtual {p2, v0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_2d
.end method
