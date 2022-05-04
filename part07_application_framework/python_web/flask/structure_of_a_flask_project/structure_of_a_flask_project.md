# Flask 项目的结构

!!! note 
    Flask 非常灵活，它其实没有特定的项目文件夹结构模式。它可以让有经验的开发者按照其自身喜好，来组织项目的目录结构。但是刚接触 flask 的开发者，则会感到困惑，他们在组织项目目录结构时需要一些指导，并且通常情况下，他们会去找一些能运行的项目结构示例，但这些项目的结构组织并不总是会很好（甚至很糟糕）。

## 错误示例

### 不要从根目录下的 `__init__.py` 中逆向导入

很多 flask 相关的文章，指南或样板示例中，都是从项目根目录中的 `__init__.py` 文件中，逆向导入模块的。例如下面：

```python
# project/__init__.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    db.init_app(app)

# project/auth/models.py
from .. import db

class User(db.Model):
    # define columns
```

这段代码本身是可以工作的，但当项目变大时，可能将面临一个**循环依赖**的问题。例如，假如有另一个扩展，需要与 `User` 这个模型（model）一起初始化:

```python
# project/__init__.py
from flask_sqlalchemy import SQLAlchemy
from another_extension import AnotherExtension
from project.auth.models import User

db = SQLAlchemy()
ext = AnotherExtension(User)
```

这时候，就产生了循环依赖的问题。因为 `auth.models` 正在从根目录导入 `db`，而根目录不能导入 `User` 模块（module）。这是一个常见的循环导入问题，不只限于 flask 。这个问题很容易解决，但是对于初级开发人员来说，却可能会很难。所以最好在一开始的时候就避免它。


### flask 官网中的相应写法

```python
def create_app(config_filename):
    app = Flask(__name__)
    app.config.from_pyfile(config_filename)
    from yourapplication.model import db
    db.init_app(app)
    from yourapplication.views.admin import admin
    from yourapplication.views.frontend import frontend
    app.register_blueprint(admin)
    app.register_blueprint(frontend)
    return app
```

官方示例 application factories 代码段中，将 `db` 放在了 `yourapplication.model` 中。

因此，建议在编写模块和包时，总是保持这个特定的规则：

!!! tip  
    **不要从根目录下的 `__init__.py` 中逆向导入**

下面是组织项目目录结构时的一些建议，但是还是需要自己思考，而非把这些建议当作金科玉律。

## 基于功能的结构

```python
project/
  __init__.py
  models/
    __init__.py
    base.py
    users.py
    posts.py
    ...
  routes/
    __init__.py
    home.py
    account.py
    dashboard.py
    ...
  templates/
    base.html
    post.html
    ...
  services/
    __init__.py
    google.py
    mail.py
    ...
```

这个示例结构中，一切都是按照功能来区分的。如果它的行为像模型，则将其放在 models 目录下；如果它的行为像路由，则将其放在 routes 目录下。在 `project/__init__.py` 中创建一个 `create_app` 工厂函数，并且初始化所有应用 `init_app`。如下：

```python
# project/__init__.py
from flask import Flask

def create_app()
    from . import models, routes, services
    app = Flask(__name__)
    models.init_app(app)
    routes.init_app(app)
    services.init_app(app)
    return app
```

在官方文档中，Flask-SQlAlchemy 中的 `db` 是通过以下方式注册的：

```python
from project.models import db
db.init_app(app)
```

有一个技巧，则是在每个文件夹中的 `__init__.py` 文件中，定义一个 `init_app` 函数，然后统一初始化进程。如下代码所示：

```python
# project/models/__init__.py
from .base import db

def init_app(app):
    db.init_app(app)

# project/routes/__init__.py
from .users import user_bp
from .posts import posts_bp
# ...

def init_app(app):
    app.register_blueprint(user_bp)
    app.register_blueprint(posts_bp)    

# ...
```






## 基于应用的结构

另一种流行的结构组织方式，是基于应用来划分，也就是按照业务项目的应用程序来分组。例如：

```python
project/
  __init__.py
  db.py
  auth/
    __init__.py
    route.py
    models.py
    templates/
  blog/
    __init__.py
    route.py
    models.py
    templates/
...
```

每个目录都对应着一个应用。Django 就默认使用这种方式来组织目录。当然这并不意味这种方式更好，还是需要依据项目特点来选择匹配的目录结构。某些时候，可能不得不使用一个混合的模式。

类似于上一种方式，可以像如下代码一样，来 init_app :

```python
# project/__init__.py
from flask import Flask

def create_app()
    from . import db, auth, blog
    app = Flask(__name__)
    db.init_app(app)
    auth.init_app(app)
    blog.init_app(app)
    return app
```

## 配置

加载配置是另一个很多人觉得困难的问题，这同样是一个文件夹结构的问题。解决方案如下：

1. 在项目目录下放一个 `settings.py` 文件，把它当作静态配置。
2. 从环境变量中加载配置。
3. 在 `create_app` 中更新配置。

一个配置的基础目录结构如下：

```python
conf/
  dev_config.py
  test_config.py
project/
  __init__.py
  settings.py
app.py
```

定义一个 `create_app` 来加载配置和环境变量：

```python
# project/__init__.py
import os
from flask import Flask

def create_app(config=None)
    app = Flask(__name__)
    # load default configuration
    app.config.from_object('project.settings')
    # load environment configuration
    if 'FLASK_CONF' in os.environ:
        app.config.from_envvar('FLASK_CONF')
    # load app sepcified configuration
    if config is not None:
        if isinstance(config, dict):
            app.config.update(config)
        elif config.endswith('.py'):
            app.config.from_pyfile(config)
    return app
```

其中，`FLASK_CONF` 是一个包含配置的 python 文件（包含路径）。这可以是任何你想要的名称, 如项目叫做 `BYA`，你可以叫它 `BYA_CONF`。可以使用 `FLASK_CONF` 来加载生产环境配置。

## 拓展阅读

[Structure of a Flask Project](https://lepture.com/en/2018/structure-of-a-flask-project)

[Application Factories](https://flask.palletsprojects.com/en/0.12.x/patterns/appfactories/#basic-factories)

[How To Structure Large Flask Applications](https://www.digitalocean.com/community/tutorials/how-to-structure-large-flask-applications)

[How I Structure My Flask Applications](https://mattupstate.com/blog/how-i-structure-my-flask-applications/)

[Explore Flask - Organizing your project](https://exploreflask.com/en/latest/organizing.html)

[Flask best practices](http://alanpryorjr.com/2019-05-20-flask-api-example/)

[项目结构及开发规范| Lin CMS](https://doc.cms.talelin.com/server/flask/)