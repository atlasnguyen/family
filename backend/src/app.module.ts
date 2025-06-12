import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import ormconfig from './config/ormconfig';
// import các module (UsersModule, TasksModule, AuthModule) ở đây

@Module({
  imports: [
    TypeOrmModule.forRoot(ormconfig as any),
    // ... các module
  ],
})
export class AppModule {}